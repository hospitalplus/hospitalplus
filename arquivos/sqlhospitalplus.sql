-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema hospitalplus
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hospitalplus` ;

-- -----------------------------------------------------
-- Schema hospitalplus
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospitalplus` DEFAULT CHARACTER SET utf8 ;
USE `hospitalplus` ;

-- -----------------------------------------------------
-- Table `Especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Especialidade` (
  `idEspecialidade` INT NOT NULL,
  `NomEspecialidade` VARCHAR(45) NULL,
  PRIMARY KEY (`idEspecialidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Especialistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Especialistas` (
  `idEspecialista` INT NOT NULL,
  `NomEsp` VARCHAR(45) NOT NULL,
  `NomSobrEsp` VARCHAR(45) NOT NULL,
  `DatNascEsp` DATE NOT NULL,
  `IndSexoEsp` CHAR(1) NOT NULL,
  `DscEmailEsp` VARCHAR(45) NOT NULL,
  `CodSenhaEsp` VARCHAR(45) NOT NULL,
  `DscCpfEsp` CHAR(11) NOT NULL,
  `DscTelEsp` CHAR(11) NOT NULL,
  `DatInclEsp` DATE NOT NULL,
  `DscRegisEsp` VARCHAR(15) NOT NULL,
  `idEspecialidade` INT NOT NULL,
  PRIMARY KEY (`idEspecialista`, `idEspecialidade`),
  INDEX `fk_Especialistas_Especialidade1_idx` (`idEspecialidade` ASC),
  CONSTRAINT `fk_Especialistas_Especialidade1`
    FOREIGN KEY (`idEspecialidade`)
    REFERENCES `Especialidade` (`idEspecialidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GrupoSanguineo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GrupoSanguineo` (
  `idGrupoSanguineo` INT NOT NULL,
  `DscTipoSanguineo` VARCHAR(3) NULL,
  PRIMARY KEY (`idGrupoSanguineo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pacientes` (
  `idPaciente` INT NOT NULL,
  `NomPaciente` VARCHAR(45) NOT NULL,
  `NomSobrPaci` VARCHAR(45) NOT NULL,
  `DatNascPaci` DATE NOT NULL,
  `IndSexoPaci` CHAR(1) NOT NULL,
  `DscEmailPaci` VARCHAR(45) NOT NULL,
  `CodSenhaPaci` VARCHAR(45) NOT NULL,
  `DscCpfPaci` CHAR(11) NOT NULL,
  `DscTelPaci` CHAR(11) NULL,
  `DatInclPaci` DATE NULL,
  `idAlergia` INT NOT NULL,
  `idGrupoSanguineo` INT NOT NULL,
  PRIMARY KEY (`idPaciente`, `idAlergia`, `idGrupoSanguineo`),
  INDEX `fk_Pacientes_GrupoSanguineo1_idx` (`idGrupoSanguineo` ASC),
  CONSTRAINT `fk_Pacientes_GrupoSanguineo1`
    FOREIGN KEY (`idGrupoSanguineo`)
    REFERENCES `GrupoSanguineo` (`idGrupoSanguineo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tratamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tratamentos` (
  `idTratamentos` INT NOT NULL,
  `DscRemedioTrat` VARCHAR(45) NOT NULL,
  `QtdDosagemTrat` DECIMAL(10,2) NOT NULL,
  `ValFreqTrat` INT NOT NULL,
  `ValPerTrat` INT NOT NULL,
  `HorInicioTrat` TIME NULL,
  `idPaciente` INT NOT NULL,
  PRIMARY KEY (`idTratamentos`, `idPaciente`),
  INDEX `fk_Tratamentos_Pacientes1_idx` (`idPaciente` ASC),
  CONSTRAINT `fk_Tratamentos_Pacientes1`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `Pacientes` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Consultas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Consultas` (
  `idConsultas` INT NOT NULL,
  `HorConsulta` TIME NOT NULL,
  `DscLocalCons` VARCHAR(250) NOT NULL,
  `DatConsulta` DATE NOT NULL,
  `idMedico` INT NOT NULL,
  `idPaciente` INT NOT NULL,
  `idTratamento` INT NOT NULL,
  `idPaciente` INT NOT NULL,
  `iidEspecialista` INT NOT NULL,
  PRIMARY KEY (`idConsultas`, `idPaciente`, `iidEspecialista`),
  INDEX `fk_Consultas_Pacientes1_idx` (`idPaciente` ASC),
  INDEX `fk_Consultas_Especialistas1_idx` (`iidEspecialista` ASC),
  CONSTRAINT `fk_Consultas_Pacientes1`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `Pacientes` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consultas_Especialistas1`
    FOREIGN KEY (`iidEspecialista`)
    REFERENCES `Especialistas` (`idEspecialista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Alergias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Alergias` (
  `idAlergia` INT NOT NULL,
  `DscMedicamentoAle` VARCHAR(250) NULL,
  `NomAlergia` VARCHAR(45) NULL,
  PRIMARY KEY (`idAlergia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pacientes_has_Alergias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pacientes_has_Alergias` (
  `Pacientes_idPaciente` INT NOT NULL,
  `Pacientes_Alergias_idAlergia` INT NOT NULL,
  `Alergias_idAlergia` INT NOT NULL,
  PRIMARY KEY (`Pacientes_idPaciente`, `Pacientes_Alergias_idAlergia`, `Alergias_idAlergia`),
  INDEX `fk_Pacientes_has_Alergias_Alergias1_idx` (`Alergias_idAlergia` ASC),
  INDEX `fk_Pacientes_has_Alergias_Pacientes_idx` (`Pacientes_idPaciente` ASC, `Pacientes_Alergias_idAlergia` ASC),
  CONSTRAINT `fk_Pacientes_has_Alergias_Pacientes`
    FOREIGN KEY (`Pacientes_idPaciente` , `Pacientes_Alergias_idAlergia`)
    REFERENCES `Pacientes` (`idPaciente` , `idAlergia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pacientes_has_Alergias_Alergias1`
    FOREIGN KEY (`Alergias_idAlergia`)
    REFERENCES `Alergias` (`idAlergia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Convenios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Convenios` (
  `idConvenios` INT NOT NULL,
  `NomConvenio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idConvenios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Especialistas_has_Convenios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Especialistas_has_Convenios` (
  `Especialistas_idEspecialista` INT NOT NULL,
  `Especialistas_idEspecialidade` INT NOT NULL,
  `Convenios_idConvenios` INT NOT NULL,
  PRIMARY KEY (`Especialistas_idEspecialista`, `Especialistas_idEspecialidade`, `Convenios_idConvenios`),
  INDEX `fk_Especialistas_has_Convenios_Convenios1_idx` (`Convenios_idConvenios` ASC),
  INDEX `fk_Especialistas_has_Convenios_Especialistas1_idx` (`Especialistas_idEspecialista` ASC, `Especialistas_idEspecialidade` ASC),
  CONSTRAINT `fk_Especialistas_has_Convenios_Especialistas1`
    FOREIGN KEY (`Especialistas_idEspecialista` , `Especialistas_idEspecialidade`)
    REFERENCES `Especialistas` (`idEspecialista` , `idEspecialidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Especialistas_has_Convenios_Convenios1`
    FOREIGN KEY (`Convenios_idConvenios`)
    REFERENCES `Convenios` (`idConvenios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Horario` (
  `idHorario` INT NOT NULL,
  `HorInicio` TIME NOT NULL,
  `HorFim` TIME NOT NULL,
  PRIMARY KEY (`idHorario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Especialistas_has_Horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Especialistas_has_Horario` (
  `Especialistas_idEspecialista` INT NOT NULL,
  `Especialistas_idEspecialidade` INT NOT NULL,
  `Horario_idHorario` INT NOT NULL,
  PRIMARY KEY (`Especialistas_idEspecialista`, `Especialistas_idEspecialidade`, `Horario_idHorario`),
  INDEX `fk_Especialistas_has_Horario_Horario1_idx` (`Horario_idHorario` ASC),
  INDEX `fk_Especialistas_has_Horario_Especialistas1_idx` (`Especialistas_idEspecialista` ASC, `Especialistas_idEspecialidade` ASC),
  CONSTRAINT `fk_Especialistas_has_Horario_Especialistas1`
    FOREIGN KEY (`Especialistas_idEspecialista` , `Especialistas_idEspecialidade`)
    REFERENCES `Especialistas` (`idEspecialista` , `idEspecialidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Especialistas_has_Horario_Horario1`
    FOREIGN KEY (`Horario_idHorario`)
    REFERENCES `Horario` (`idHorario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LocalAtendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LocalAtendimento` (
  `idLocalAtendimento` INT NOT NULL,
  `DscLocalAtendimento` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`idLocalAtendimento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LocalAtendimento_has_Especialistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LocalAtendimento_has_Especialistas` (
  `LocalAtendimento_idLocalAtendimento` INT NOT NULL,
  `Especialistas_idEspecialista` INT NOT NULL,
  `Especialistas_idEspecialidade` INT NOT NULL,
  PRIMARY KEY (`LocalAtendimento_idLocalAtendimento`, `Especialistas_idEspecialista`, `Especialistas_idEspecialidade`),
  INDEX `fk_LocalAtendimento_has_Especialistas_Especialistas1_idx` (`Especialistas_idEspecialista` ASC, `Especialistas_idEspecialidade` ASC),
  INDEX `fk_LocalAtendimento_has_Especialistas_LocalAtendimento1_idx` (`LocalAtendimento_idLocalAtendimento` ASC),
  CONSTRAINT `fk_LocalAtendimento_has_Especialistas_LocalAtendimento1`
    FOREIGN KEY (`LocalAtendimento_idLocalAtendimento`)
    REFERENCES `LocalAtendimento` (`idLocalAtendimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LocalAtendimento_has_Especialistas_Especialistas1`
    FOREIGN KEY (`Especialistas_idEspecialista` , `Especialistas_idEspecialidade`)
    REFERENCES `Especialistas` (`idEspecialista` , `idEspecialidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
